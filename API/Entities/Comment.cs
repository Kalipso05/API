using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class Comment
{
    public int Id { get; set; }

    public string? Text { get; set; }

    public DateTime? DateCreated { get; set; }

    public DateTime? DateUpdated { get; set; }

    public int? IdDocument { get; set; }

    public int? IdAuthor { get; set; }

    public virtual Employee? IdAuthorNavigation { get; set; }

    public virtual Document? IdDocumentNavigation { get; set; }
}
