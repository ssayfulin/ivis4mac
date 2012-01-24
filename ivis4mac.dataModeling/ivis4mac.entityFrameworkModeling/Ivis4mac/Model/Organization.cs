using System.ComponentModel.DataAnnotations;

namespace Ivis4Mac.Model
{
    public class Organization
    {
        public int Id { set; get; }
        
      
        //Название
        public string OrganizationName { set; get; }



        public OrganizationType OrganizationType { set; get; }
        
        public Address Address { set; get; }
        public Contact Contact { set; get; }
        public Document Information { set; get; }
    }
}