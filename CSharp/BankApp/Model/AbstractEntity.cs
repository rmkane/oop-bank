namespace BankApp.Model
{
  public abstract class AbstractEntity : IEntity
  {
    public string Id { get; set; }

    protected AbstractEntity(string id)
    {
      Id = id;
    }
  }
}
