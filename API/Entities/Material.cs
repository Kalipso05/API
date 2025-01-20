using System;
using System.Collections.Generic;

namespace API.Entities;

public partial class Material
{
    public int MaterialId { get; set; }

    public string MaterialName { get; set; } = null!;

    public DateOnly ApprovalDate { get; set; }

    public DateOnly ModificationDate { get; set; }

    public int MaterialStatusId { get; set; }

    public int MaterialTypeId { get; set; }

    public string Domain { get; set; } = null!;

    public string Author { get; set; } = null!;

    public virtual MaterialStatus MaterialStatus { get; set; } = null!;

    public virtual MaterialType MaterialType { get; set; } = null!;

    public virtual ICollection<TrainingClass> TrainingClasses { get; set; } = new List<TrainingClass>();
}
