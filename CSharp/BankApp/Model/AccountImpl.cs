namespace BankApp.Model
{
  public class AccountImpl : AbstractEntity, IEntity
  {
    public double Balance { get; set; }
    public AccountType Type { get; set; }

    public AccountImpl(string id, double balance, AccountType type) : base(id)
    {
      Balance = balance;
      Type = type;
    }
  }
}
