using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class EventEmployeeType
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public virtual ICollection<EventEmployee> EventEmployees { get; set; } = new List<EventEmployee>();
}
