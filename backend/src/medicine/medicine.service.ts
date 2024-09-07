import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Medicine, MedicineDocument } from 'schemas/medicine.schema';
import { CreateMedicineDto, UpdateMedicineDto } from './medicine.dto';


@Injectable()
export class MedicineService {
  constructor(@InjectModel(Medicine.name) private medicineModel: Model<MedicineDocument>) {}

  async createMedicine(createMedicineDto: CreateMedicineDto): Promise<Medicine> {
    const newMedicine = new this.medicineModel(createMedicineDto);
    await newMedicine.save();
    return newMedicine.toObject();
  }

  async getMedicineById(id: string): Promise<Medicine> {
    return this.medicineModel.findById(id).exec();
  }

  async updateMedicine(id: string, updateMedicineDto: UpdateMedicineDto): Promise<Medicine> {
    return this.medicineModel.findByIdAndUpdate(id, updateMedicineDto, { new: true }).exec();
  }

  async deleteMedicine(id: string): Promise<any> {
    return this.medicineModel.findByIdAndDelete(id).exec();
  }

  async getAllMedicine(): Promise<Medicine[]> {
    return this.medicineModel.find().exec();
  }
}
