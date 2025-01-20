using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class Calendar
{
    public int CalendarId { get; set; }

    public int? EmployeeId { get; set; }

    public int? DepartmentId { get; set; }

    public int CalendarTypeId { get; set; }

    public virtual CalendarType CalendarType { get; set; } = null!;

    public virtual Department? Department { get; set; }

    public virtual Employee? Employee { get; set; }

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();
}
