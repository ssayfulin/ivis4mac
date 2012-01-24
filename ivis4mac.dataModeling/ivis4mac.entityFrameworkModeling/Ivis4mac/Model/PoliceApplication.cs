using System;
using System.Collections.Generic;

namespace Ivis4Mac.Model
{
    /// <summary>
    ///  Q: сначала заявление 
    ///     следватель когда появляется
    ///     следователь один или несколько
    ///    
    /// </summary>
    public class PoliceApplication
    {
        public int Id { set; get; }

        //Дата подачи заявления в полицию – число, месяц, год.
        public DateTime ApplicationDate { set; get; }

        //Заявление подано в – поле для заполнения, в котором указано ОВД или УВД, в которое подано заявление.
        public Organization Organization { set; get; }

        // следователь 
        public Person InvestigationOfficer { set; get; }

        //*Контактные персоны – с кем разговаривали в полиции, кто может прояснить информацию по делу. 
        public List<Person> ContactPersons { set; get; }

        //Дело заведено – да/нет/неизвестно
        public bool InvestigationProcessed { set; get; }

        //Дело заведено – да/нет/неизвестно
        // статья ук?
        public bool LowArticle { set; get; }


        //*Данные дела – номер дела и поле со свитком розыскное дело/уголовное дело.
        public string Number { set; get; }
        public PoliceRecordType Type { set; get; }


        //*История дела – поля для свободного заполнения, кому и когда дело передавалось, в какие органы, что предпринималось.
        public Document History { set; get; }
    }
}