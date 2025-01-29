using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class EventEmployee
{
    public int Id { get; set; }

    public int? EmployeeId { get; set; }

    public DateOnly? DateStart { get; set; }

    public DateOnly? DateEnd { get; set; }

    public int? EventEmployeeTypeId { get; set; }

    public virtual Employee? Employee { get; set; }

    public virtual EventEmployeeType? EventEmployeeType { get; set; }
}
