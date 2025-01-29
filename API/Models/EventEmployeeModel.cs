using API.Entities;

namespace API.Models
{
    public class EventEmployeeModel
    {
        public int Id { get; set; }

        public int? EmployeeId { get; set; }

        public DateOnly? DateStart { get; set; }

        public DateOnly? DateEnd { get; set; }

        public int? EventEmployeeTypeId { get; set; }
        public string? EventEmployeeTypeName { get; set; }

        public EventEmployeeModel(EventEmployee employee)
        {
            Id = employee.Id;
            EmployeeId = employee.EmployeeId;
            DateStart = employee.DateStart;
            DateEnd = employee.DateEnd;
            EventEmployeeTypeId = employee.EventEmployeeTypeId;
            EventEmployeeTypeName = employee.EventEmployeeType.Title;
        }
    }
}
