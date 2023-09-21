using System.Collections.Generic;

namespace BankApp.Model
{
  public interface ICustomer : IEntity, IHasBalance, IHasSummary
  {
    string Name { get; set; }
    List<IAccount> Accounts { get; set; }
  }
}
