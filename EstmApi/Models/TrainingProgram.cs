namespace EstmApi.Models
{
  public class TrainingProgram {
    public int Id { get; set; }
    public string JobTitle { get; set; } = string.Empty;
    public string TrainingPath { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string AdmissionDiploma { get; set; } = string.Empty;
    public string Fee { get; set; } = string.Empty;
}

public enum ItemType { Metier, Formation }

public class DiscoveryItem
{
    public int Id { get; set; }
    public ItemType Type { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Institution { get; set; } = string.Empty;
    public string Domain { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Requirements { get; set; } = string.Empty;
    public string? Fee { get; set; }
}
}