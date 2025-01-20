using API.Entities;

namespace API.Models
{
    public class EventModel
    {
        public int EventId { get; set; }

        public int? CalendarId { get; set; }
        public string EventName { get; set; } = null!;
        public string? Name { get; set; }
        public string? LastName { get; set; }
        public string? MiddleName { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string? Description { get; set; }

        public EventModel(Event ev)
        {
            EventId = ev.EventId;
            CalendarId = ev.CalendarId;
            EventName = ev.EventName;
            Name = ev.Calendar.Employee.FirstName;
            LastName = ev.Calendar.Employee.LastName;
            MiddleName = ev.Calendar.Employee.MiddleName;
            StartDate = ev.StartDate;
            EndDate = ev.EndDate;
            Description = ev.Description;
        }
    }
}
