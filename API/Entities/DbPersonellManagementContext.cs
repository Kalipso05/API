using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace API.Entities;

public partial class DbPersonellManagementContext : DbContext
{
    public DbPersonellManagementContext()
    {
    }

    public DbPersonellManagementContext(DbContextOptions<DbPersonellManagementContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Absence> Absences { get; set; }

    public virtual DbSet<Calendar> Calendars { get; set; }

    public virtual DbSet<CalendarType> CalendarTypes { get; set; }

    public virtual DbSet<Candidate> Candidates { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventEmployee> EventEmployees { get; set; }

    public virtual DbSet<EventEmployeeType> EventEmployeeTypes { get; set; }

    public virtual DbSet<EventStatus> EventStatuses { get; set; }

    public virtual DbSet<EventType> EventTypes { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialStatus> MaterialStatuses { get; set; }

    public virtual DbSet<MaterialType> MaterialTypes { get; set; }

    public virtual DbSet<Position> Positions { get; set; }

    public virtual DbSet<TrainingClass> TrainingClasses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-OQEURJG\\SQLEXPRESS;Database=dbPersonellManagement;TrustServerCertificate=true;Trusted_Connection=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Absence>(entity =>
        {
            entity.HasKey(e => e.AbsenceId).HasName("PK__Absences__3A074E4789BDE0A8");

            entity.Property(e => e.AbsenceId).HasColumnName("AbsenceID");
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.SubstituteId).HasColumnName("SubstituteID");

            entity.HasOne(d => d.Employee).WithMany(p => p.AbsenceEmployees)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("FK__Absences__Employ__778AC167");

            entity.HasOne(d => d.Substitute).WithMany(p => p.AbsenceSubstitutes)
                .HasForeignKey(d => d.SubstituteId)
                .HasConstraintName("FK__Absences__Substi__787EE5A0");
        });

        modelBuilder.Entity<Calendar>(entity =>
        {
            entity.HasKey(e => e.CalendarId).HasName("PK__Calendar__53CFDBAD70A118A3");

            entity.Property(e => e.CalendarId).HasColumnName("CalendarID");
            entity.Property(e => e.CalendarTypeId).HasColumnName("CalendarTypeID");
            entity.Property(e => e.DepartmentId).HasColumnName("DepartmentID");
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

            entity.HasOne(d => d.CalendarType).WithMany(p => p.Calendars)
                .HasForeignKey(d => d.CalendarTypeId)
                .HasConstraintName("FK__Calendars__Calen__5AEE82B9");

            entity.HasOne(d => d.Department).WithMany(p => p.Calendars)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK__Calendars__Depar__59FA5E80");

            entity.HasOne(d => d.Employee).WithMany(p => p.Calendars)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Calendars__Emplo__59063A47");
        });

        modelBuilder.Entity<CalendarType>(entity =>
        {
            entity.HasKey(e => e.CalendarTypeId).HasName("PK__Calendar__024C0F5C9EBD42AA");

            entity.HasIndex(e => e.CalendarTypeName, "UQ__Calendar__0715E7A82BE510F9").IsUnique();

            entity.Property(e => e.CalendarTypeId).HasColumnName("CalendarTypeID");
            entity.Property(e => e.CalendarTypeName).HasMaxLength(50);
        });

        modelBuilder.Entity<Candidate>(entity =>
        {
            entity.HasKey(e => e.CandidateId).HasName("PK__Candidat__DF539BFC6BAAF51D");

            entity.Property(e => e.CandidateId).HasColumnName("CandidateID");
            entity.Property(e => e.Field).HasMaxLength(100);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.Property(e => e.DateCreated).HasColumnType("datetime");
            entity.Property(e => e.DateUpdated).HasColumnType("datetime");
            entity.Property(e => e.Text).HasMaxLength(50);

            entity.HasOne(d => d.IdAuthorNavigation).WithMany(p => p.Comments)
                .HasForeignKey(d => d.IdAuthor)
                .HasConstraintName("FK_Comments_Employees");

            entity.HasOne(d => d.IdDocumentNavigation).WithMany(p => p.Comments)
                .HasForeignKey(d => d.IdDocument)
                .HasConstraintName("FK_Comments_Documents");
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.HasKey(e => e.DepartmentId).HasName("PK__Departme__B2079BCD3A34D257");

            entity.HasIndex(e => e.DepartmentName, "UQ__Departme__D949CC34E4098B20").IsUnique();

            entity.Property(e => e.DepartmentId).HasColumnName("DepartmentID");
            entity.Property(e => e.DepartmentName).HasMaxLength(100);
            entity.Property(e => e.ManagerId).HasColumnName("ManagerID");
        });

        modelBuilder.Entity<Document>(entity =>
        {
            entity.Property(e => e.Category).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.EmployeeId).HasName("PK__Employee__7AD04FF1A62F8F00");

            entity.HasIndex(e => e.Email, "UQ__Employee__A9D105347D925957").IsUnique();

            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.AssistantId).HasColumnName("AssistantID");
            entity.Property(e => e.DepartmentId).HasColumnName("DepartmentID");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.MiddleName).HasMaxLength(50);
            entity.Property(e => e.MobilePhone).HasMaxLength(20);
            entity.Property(e => e.Office).HasMaxLength(10);
            entity.Property(e => e.PositionId).HasColumnName("PositionID");
            entity.Property(e => e.SupervisorId).HasColumnName("SupervisorID");
            entity.Property(e => e.WorkPhone).HasMaxLength(20);

            entity.HasOne(d => d.Assistant).WithMany(p => p.InverseAssistant)
                .HasForeignKey(d => d.AssistantId)
                .HasConstraintName("FK__Employees__Assis__534D60F1");

            entity.HasOne(d => d.Department).WithMany(p => p.Employees)
                .HasForeignKey(d => d.DepartmentId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Employees__Depar__5070F446");

            entity.HasOne(d => d.Position).WithMany(p => p.Employees)
                .HasForeignKey(d => d.PositionId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Employees__Posit__5165187F");

            entity.HasOne(d => d.Supervisor).WithMany(p => p.InverseSupervisor)
                .HasForeignKey(d => d.SupervisorId)
                .HasConstraintName("FK__Employees__Super__52593CB8");
        });

        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.EventId).HasName("PK__Events__7944C8703A2FBC25");

            entity.Property(e => e.EventId).HasColumnName("EventID");
            entity.Property(e => e.CalendarId).HasColumnName("CalendarID");
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.EventName).HasMaxLength(100);
            entity.Property(e => e.EventStatusId).HasColumnName("EventStatusID");
            entity.Property(e => e.EventTypeId).HasColumnName("EventTypeID");
            entity.Property(e => e.StartDate).HasColumnType("datetime");

            entity.HasOne(d => d.Calendar).WithMany(p => p.Events)
                .HasForeignKey(d => d.CalendarId)
                .HasConstraintName("FK__Events__Calendar__6383C8BA");

            entity.HasOne(d => d.EventStatus).WithMany(p => p.Events)
                .HasForeignKey(d => d.EventStatusId)
                .HasConstraintName("FK__Events__EventSta__656C112C");

            entity.HasOne(d => d.EventType).WithMany(p => p.Events)
                .HasForeignKey(d => d.EventTypeId)
                .HasConstraintName("FK__Events__EventTyp__6477ECF3");
        });

        modelBuilder.Entity<EventEmployee>(entity =>
        {
            entity.ToTable("EventEmployee");

            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.EventEmployeeTypeId).HasColumnName("EventEmployeeTypeID");

            entity.HasOne(d => d.Employee).WithMany(p => p.EventEmployees)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("FK_EventEmployee_Employees");

            entity.HasOne(d => d.EventEmployeeType).WithMany(p => p.EventEmployees)
                .HasForeignKey(d => d.EventEmployeeTypeId)
                .HasConstraintName("FK_EventEmployee_EventEmployeeType");
        });

        modelBuilder.Entity<EventEmployeeType>(entity =>
        {
            entity.ToTable("EventEmployeeType");

            entity.Property(e => e.Title).HasMaxLength(50);
        });

        modelBuilder.Entity<EventStatus>(entity =>
        {
            entity.HasKey(e => e.EventStatusId).HasName("PK__EventSta__2EB6674C6E8C456D");

            entity.HasIndex(e => e.EventStatusName, "UQ__EventSta__177BEE28506BD153").IsUnique();

            entity.Property(e => e.EventStatusId).HasColumnName("EventStatusID");
            entity.Property(e => e.EventStatusName).HasMaxLength(50);
        });

        modelBuilder.Entity<EventType>(entity =>
        {
            entity.HasKey(e => e.EventTypeId).HasName("PK__EventTyp__A9216B1F08B1FF92");

            entity.HasIndex(e => e.EventTypeName, "UQ__EventTyp__29BD765FDC30F694").IsUnique();

            entity.Property(e => e.EventTypeId).HasColumnName("EventTypeID");
            entity.Property(e => e.EventTypeName).HasMaxLength(50);
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.MaterialId).HasName("PK__Material__C50613170A2F2A92");

            entity.Property(e => e.MaterialId).HasColumnName("MaterialID");
            entity.Property(e => e.Author).HasMaxLength(100);
            entity.Property(e => e.Domain).HasMaxLength(100);
            entity.Property(e => e.MaterialName).HasMaxLength(100);
            entity.Property(e => e.MaterialStatusId).HasColumnName("MaterialStatusID");
            entity.Property(e => e.MaterialTypeId).HasColumnName("MaterialTypeID");

            entity.HasOne(d => d.MaterialStatus).WithMany(p => p.Materials)
                .HasForeignKey(d => d.MaterialStatusId)
                .HasConstraintName("FK__Materials__Mater__6E01572D");

            entity.HasOne(d => d.MaterialType).WithMany(p => p.Materials)
                .HasForeignKey(d => d.MaterialTypeId)
                .HasConstraintName("FK__Materials__Mater__6EF57B66");
        });

        modelBuilder.Entity<MaterialStatus>(entity =>
        {
            entity.HasKey(e => e.MaterialStatusId).HasName("PK__Material__AA6D95220E9611D4");

            entity.HasIndex(e => e.MaterialStatusName, "UQ__Material__39E1C371EBED9334").IsUnique();

            entity.Property(e => e.MaterialStatusId).HasColumnName("MaterialStatusID");
            entity.Property(e => e.MaterialStatusName).HasMaxLength(50);
        });

        modelBuilder.Entity<MaterialType>(entity =>
        {
            entity.HasKey(e => e.MaterialTypeId).HasName("PK__Material__1621BBFF4BB72736");

            entity.HasIndex(e => e.MaterialTypeName, "UQ__Material__AB21FEE514CE2CE7").IsUnique();

            entity.Property(e => e.MaterialTypeId).HasColumnName("MaterialTypeID");
            entity.Property(e => e.MaterialTypeName).HasMaxLength(50);
        });

        modelBuilder.Entity<Position>(entity =>
        {
            entity.HasKey(e => e.PositionId).HasName("PK__Position__60BB9A591896999C");

            entity.HasIndex(e => e.PositionName, "UQ__Position__E46AEF4273A26528").IsUnique();

            entity.Property(e => e.PositionId).HasColumnName("PositionID");
            entity.Property(e => e.PositionName).HasMaxLength(100);
        });

        modelBuilder.Entity<TrainingClass>(entity =>
        {
            entity.HasKey(e => e.TrainingId).HasName("PK__Training__E8D71DE24F4233B7");

            entity.Property(e => e.TrainingId).HasColumnName("TrainingID");
            entity.Property(e => e.EventId).HasColumnName("EventID");
            entity.Property(e => e.MaterialId).HasColumnName("MaterialID");

            entity.HasOne(d => d.Event).WithMany(p => p.TrainingClasses)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("FK__TrainingC__Event__71D1E811");

            entity.HasOne(d => d.Material).WithMany(p => p.TrainingClasses)
                .HasForeignKey(d => d.MaterialId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK__TrainingC__Mater__72C60C4A");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
