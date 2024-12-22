import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/Current_Events.dart';
import 'package:pig_keep/Components/EventsHistory.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/SearchBar_Events.dart';
import 'package:pig_keep/Components/UpcomingEvents.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/pig-event-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  // services
  final pigEventService = globalLocator.get<PigEventService>();
  final pigService = globalLocator.get<PigService>();
  final penService = globalLocator.get<PigPenService>();

  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _pigUuidController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();

  String? pigUuidHidden;

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  bool showUpcomingEvents = false;
  bool showEventsHistory = false;

  var selectedFarm;
  late String userOwner;
  List<Map<String, dynamic>> pigs = [];
  List<PigPen> pigPens = [];
  List<PigEvent> selectedMonthEvents = [];
  List<PigEvent> currentWIPEvents = [];
  List<PigEvent> upcomingEvents = [];
  List<PigEvent> eventHistory = [];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day == selectedDay ? null : day;
      //focusedDay = focusedDay;
    });
  }

  void _toggleView() {
    if (!showUpcomingEvents) {
      getUpcomingEvents();
    }
    setState(() {
      showUpcomingEvents = !showUpcomingEvents;
    });
  }

  Future<void> markEventDone(String eventUuid) async {
    await pigEventService.markEventAsCompleted(eventUuid);
    getSelectedMonthEvents();
    getWIPEvents();
    getUpcomingEvents();
    getEventHistory();
  }

  Future<void> updateEvent(String eventUuid, DateTime eventDate, String pigUuid,
      String eventType) async {
    await pigEventService.updateEvent(eventUuid, eventDate, pigUuid, eventType);
    getSelectedMonthEvents();
    getWIPEvents();
    getUpcomingEvents();
    getEventHistory();
  }

  void _toggleHistoryView() {
    setState(() {
      showEventsHistory = !showEventsHistory;
    });
  }

  Future<void> getPigs() async {
    // fetch all pens first
    List<PigPen> pens =
        await penService.fetchPigPens(selectedFarm['_id'], userOwner);
    final fetchPigs = await pigService.fetchAllPigsInAllPens(pens);
    setState(() {
      pigs = fetchPigs;
      pigPens = pens;
    });
  }

  Future<void> getSelectedMonthEvents() async {
    final events = await pigEventService.getMonthlyEvents(
        selectedFarm['_id'], focusedDay.month, focusedDay.year);
    setState(() {
      selectedMonthEvents = events;
    });
  }

  Future<void> getWIPEvents() async {
    final events = await pigEventService.getWIPEvents(selectedFarm['_id']);
    setState(() {
      currentWIPEvents = events;
    });
  }

  Future<void> getUpcomingEvents() async {
    final events = await pigEventService.getUpcomingEvents(selectedFarm['_id']);
    setState(() {
      upcomingEvents = events;
    });
  }

  Future<void> getEventHistory() async {
    final events = await pigEventService.getEventHistory(selectedFarm['_id']);
    setState(() {
      eventHistory = events;
    });
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _eventDateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  List<PigEvent> _getEventsForDay(DateTime day) {
    const statusOrder = {
      'In Progress': 0,
      'Pending': 1,
      'Completed': 2,
    };
    return selectedMonthEvents
        .where((event) => PigHelper.isSameDay(event.eventDate, day))
        .toList()
      ..sort(
          (a, b) => statusOrder[a.status]!.compareTo(statusOrder[b.status]!));
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
      getPigs();
      getSelectedMonthEvents();
      getWIPEvents();
      getEventHistory();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
    getPigs();
    getSelectedMonthEvents();
    getWIPEvents();
    getEventHistory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FarmName(),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w),
                          Text(
                            'Set events for your pig farm to be updated \nand notified.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            height: 95.h,
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: appPrimary),
                              color: appPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 14.h),
                                    Row(
                                      children: [
                                        Text(
                                          PigHelper.getCurrentMonthYear(),
                                          style: TextStyle(
                                            color: appSecondary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300,
                                            height: 1.2.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Events',
                                            style: TextStyle(
                                                height: 1.0,
                                                color: appSecondary,
                                                fontSize: 50.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 36.h,
                                      width: 68.w,
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 8.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: appPrimary),
                                        color: appSecondary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ReusableDialogBox(
                                                title: 'Set Events',
                                                description:
                                                    'Fill up the form to set an event for your pig farm.',
                                                formFields: [
                                                  RecyclableTextFormField(
                                                    controller:
                                                        _eventDateController,
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                    labelText: 'Set Event',
                                                    hintText: 'YYYY/MM/DD',
                                                    hintTextSize: 14.sp,
                                                    icon: Icons.calendar_month,
                                                    textSize: 14.sp,
                                                    onTap: () {
                                                      _selectDate();
                                                    },
                                                    readOnly: true,
                                                  ),
                                                  RecyclableTextFormField(
                                                    controller:
                                                        _pigUuidController,
                                                    labelText: 'Pig Number',
                                                    hintText: 'Pig Number',
                                                    showDropdown: true,
                                                    isHiddenText: true,
                                                    onChanged: (v) =>
                                                        {pigUuidHidden = v},
                                                    dropdownItems: pigs
                                                        .where((pig) =>
                                                            pig['status'] ==
                                                            'alive')
                                                        .map((pig) =>
                                                            CustomDropDownItem(
                                                                pig['uuid'],
                                                                'Pig: ${pig['pigNumber']} | Pen: ${pig['penNumber']}'))
                                                        .toList(),
                                                    hintTextSize: 14.sp,
                                                    icon: Icons.savings,
                                                    textSize: 14.sp,
                                                  ),
                                                  RecyclableTextFormField(
                                                    controller:
                                                        _eventTypeController,
                                                    labelText: 'Event',
                                                    showDropdown: true,
                                                    dropdownItems: [
                                                      CustomDropDownItem(
                                                          'Vaccination',
                                                          'Vaccination'),
                                                      CustomDropDownItem(
                                                          'Farrowing',
                                                          'Farrowing'),
                                                      CustomDropDownItem(
                                                          'Artificial Insemination',
                                                          'Artificial Insemination'),
                                                    ],
                                                    hintText: 'Event',
                                                    hintTextSize: 14.sp,
                                                    icon: Icons.event_note,
                                                    textSize: 14.sp,
                                                    readOnly: true,
                                                  ),
                                                ],
                                                onSave: () async {
                                                  try {
                                                    if (pigUuidHidden == null) {
                                                      throw 'Please select pig!';
                                                    }
                                                    await pigEventService
                                                        .addNewEvent(
                                                            selectedFarm['_id'],
                                                            DateTime.parse(
                                                                _eventDateController
                                                                    .text),
                                                            pigUuidHidden!,
                                                            _eventTypeController
                                                                .text,
                                                            'Pending');

                                                    context.pop();
                                                    getSelectedMonthEvents();
                                                    getWIPEvents();
                                                    getUpcomingEvents();
                                                    _pigUuidController.clear();
                                                    _eventDateController
                                                        .clear();
                                                    _eventTypeController
                                                        .clear();
                                                    pigUuidHidden = null;
                                                  } catch (err) {
                                                    ToastService()
                                                        .showErrorToast(
                                                            err.toString());
                                                  }
                                                },
                                                saveButtonText: 'Set',
                                                saveButtonColor: appPrimary,
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: appTertiary,
                                              size: 20.h,
                                            ),
                                            SizedBox(width: 3.h),
                                            Text(
                                              'Set',
                                              style: TextStyle(
                                                color: appTertiary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                    if (showUpcomingEvents)
                      UpcomingEvents(
                        onReturn: _toggleView,
                        events: upcomingEvents, // Pass the toggle function
                        pigs: pigs,
                        updatePigEvent: updateEvent,
                      )
                    else if (showEventsHistory)
                      EventsHistory(
                        onReturn: _toggleHistoryView,
                        events: eventHistory, // Pass the toggle function
                      )
                    else
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: _toggleView,
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: 40.w,
                                        color: appTertiary,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SearchBar_Events(),
                                SizedBox(
                                  width: 20.w,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                right: 15.w,
                              ),
                              child: TableCalendar(
                                locale: "en_US",
                                rowHeight: 35.h,
                                headerStyle: HeaderStyle(
                                  headerMargin: EdgeInsets.only(
                                    top: 1.h,
                                    bottom: 1.h,
                                  ),
                                  headerPadding: EdgeInsets.only(
                                    top: 1.h,
                                    bottom: 1.h,
                                  ),
                                  leftChevronIcon: Icon(
                                    Icons.chevron_left,
                                    color: appPrimary,
                                  ),
                                  rightChevronIcon: Icon(
                                    Icons.chevron_right,
                                    color: appTertiary,
                                  ),
                                  titleTextStyle: TextStyle(
                                      fontSize: 13.sp, color: appPrimary),
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                daysOfWeekHeight: 30.h,
                                availableGestures: AvailableGestures.all,
                                selectedDayPredicate: (day) =>
                                    isSameDay(day, selectedDay),
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2040, 10, 16),
                                onDaySelected: _onDaySelected,
                                focusedDay: focusedDay,
                                startingDayOfWeek: StartingDayOfWeek.sunday,
                                calendarStyle: CalendarStyle(
                                  selectedDecoration: BoxDecoration(
                                    color: appPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  todayTextStyle: TextStyle(color: appTertiary),
                                  weekendTextStyle:
                                      TextStyle(color: appPrimary),
                                  defaultTextStyle:
                                      TextStyle(color: appPrimary),
                                  selectedTextStyle:
                                      TextStyle(color: appSecondary),
                                ),
                                onPageChanged: (focDay) {
                                  setState(() {
                                    selectedDay = null;
                                    focusedDay = focDay;
                                  });
                                  getSelectedMonthEvents();
                                },
                                eventLoader: (day) {
                                  return _getEventsForDay(day);
                                },
                                calendarBuilders: CalendarBuilders(
                                  markerBuilder: (context, day, events) {
                                    // Display the number of events for each day
                                    if (events.isNotEmpty) {
                                      int totalLength = events.length;
                                      int totalNotDone = events
                                          .where((e) =>
                                              e is PigEvent &&
                                              e.status != 'Completed')
                                          .toList()
                                          .length;
                                      bool isAllDone = totalNotDone == 0;
                                      int markerEventCount = !isAllDone
                                          ? totalNotDone
                                          : totalLength;
                                      return Positioned(
                                        top: 1,
                                        right: 3,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: isAllDone
                                                ? Colors.blue
                                                : Colors
                                                    .red, // Background color for the event number
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            '$markerEventCount',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return SizedBox
                                        .shrink(); // If no events, return an empty widget
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                            if (selectedDay != null &&
                                _getEventsForDay(selectedDay!).isNotEmpty) ...[
                              // Check if events exist
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "${PigHelper.formatToWeekDay(selectedDay!)}'s Events",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: appTertiary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CurrentEvents(
                                events: selectedMonthEvents
                                    .where((event) =>
                                        isSameDay(event.eventDate, selectedDay))
                                    .toList(),
                                markAsDone: markEventDone,
                              ),
                            ],
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  "Current Events",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: appTertiary,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _toggleHistoryView,
                                  child: Text(
                                    "See history",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: appPrimary,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (showUpcomingEvents)
                              UpcomingEvents(
                                onReturn: _toggleView,
                                events: upcomingEvents,
                              )
                            else
                              CurrentEvents(
                                events: currentWIPEvents,
                                markAsDone: markEventDone,
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
