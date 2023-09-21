namespace BankApp.Model
{
  public interface IAccount : IEntity
  {
    double Balance { get; set; }
    AccountType Type { get; set;  }
  }
}
