export const formatCurrency = (amount: number) => {
    return `${amount.toLocaleString('en-PH', {
      style: 'currency',
      currency: 'PHP',
    })}`;
  };

export const formatDate = (date: Date) => {
    return date.toLocaleString('en-US', { year: 'numeric', month: 'short', day: 'numeric' })
}

export const formatDateNumeric = (date: Date) => {
    return date.toISOString().split('T')[0]
}

export const getTodayMidnight = () => {
    const today = new Date()
    today.setHours(0, 0, 0, 0)
    return today
}

export const getTodayPlusDays = (days: number) => {
    const today = new Date()
    today.setDate(today.getDate() + days)
    return today
}

export const generateSalesData = (data: any[], dateKeyName: string, valueKeyName: string) => {
    const salesData = Array.from({ length: 12}, () => 0)
    data.forEach((item: any) => {
      const date = new Date(item[dateKeyName])
      const month = date.getMonth()
      salesData[month] += item[valueKeyName]
    })
    return salesData
}

export const generateYearlySalesData = (year: number, data: any[], dateKeyName: string, valueKeyName: string) => {
    return generateSalesData(data.filter((item) => new Date(item[dateKeyName]).getFullYear() === year), dateKeyName, valueKeyName)
}