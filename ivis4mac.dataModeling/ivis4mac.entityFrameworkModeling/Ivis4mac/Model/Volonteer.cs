using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Ivis4Mac.Model
{
    public class Volonteer
    {
        public int Id { get; set; }
     
        public Person Person { set; get; }

        public string Skill { get; set; }

        public List<VolonteerActivityType> Activities { set; get; }
        public VolonteerCarType VolonteerCar { set; get; }
        public List<Equipment> Equipment { set; get; }
        public string Profession { set; get; }
        public Document Skills { set; get; }
        public Document ExtraInformation { set; get; }
        //*Контакты родных – возможность трех дублей (трех родных).

        public List<Person> Relatives { set; get; }
    }
}