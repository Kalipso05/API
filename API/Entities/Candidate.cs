using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class Candidate
{
    public int CandidateId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public DateOnly ApplicationDate { get; set; }

    public string Field { get; set; } = null!;

    public string Resume { get; set; } = null!;
}
