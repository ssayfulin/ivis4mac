using System.Collections.Generic;

namespace Ivis4Mac.Model
{
    public class MissingPerson
    {   
        public int Id { get; set; }
        public Person Person { set; get; }
        
        // Фотография(ии) - .jpg .bmp .png .gif
        public List<FileLink> Images { get; set; }

        // Приметы
        public List<PersonSign> PersonSigns { set; get; }  // Может лучше документ

        // Одежда
        public List<ClothingItem> Clothing { set; get; }

        // Контакты родных – возможность трех дублей (трех родных).
        public List<Person> Relatives { set; get; }
    }
}