using System.ComponentModel.DataAnnotations;

namespace Ivis4Mac.Model
{
    public class PersonSign
    {
        public int Id { set; get; }

        public PersonSignType SignType { set; get; }

        // напирмер зеленый для SignType="Цвет глаз";
        public string Value { set; get; }

        //Телосложение (худощавое, среднее, спортивное, полное)
        //Волосы (короткие, средние, длинные, до плеч, до пояса, нет)

        //Цвет волос
        //Прическа

        //Овал лица
        //Цвет глаз
        //Особые  приметы
        //На лице
        //На теле

        // Рост в см.
        // public int Height { set; get; }
    }
}