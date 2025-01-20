using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class Document
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public DateOnly? DateCreated { get; set; }

    public DateOnly? DateUpdated { get; set; }

    public string? Category { get; set; }

    public bool? HasComments { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();
}
