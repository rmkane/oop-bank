using System.Collections.Generic;
using System.Linq;

namespace BankApp.Model
{
  public class CustomerImpl : AbstractEntity, ICustomer
  {
    public string Name { get; set; }
    public List<IAccount> Accounts { get; set; }

    public CustomerImpl(string id, string name): base(id)
    {
      Name = name;
      Accounts = new List<IAccount>();
    }

    public double GetTotalBalance()
    {
      return 0; // Accounts.Select(x -> x.Balance).Aggregate(0.0, (acc, x) -> acc + x);
    }

    public string GetSummary()
    {
      return "";
    }
  }
}
