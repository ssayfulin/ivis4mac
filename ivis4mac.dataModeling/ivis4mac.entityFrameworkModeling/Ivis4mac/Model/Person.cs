using System;
using System.ComponentModel.DataAnnotations;

namespace Ivis4Mac.Model
{
    public class Person
    {
        public int Id { get; set; }
        //ФИО – фамилия, имя и отчество.
        //Фамилия
        //Имя
        //Отчество

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PatronymicName { get; set; }

        // Дата рождения – выпадающие свитки по числу, месяцу и году, сбоку, 
        // автоматически, в скобках, выставляется сколько полных лет на настоящий момент.
        public DateTime BirthDay { set; get; }
        public Address Address { set; get; }
        public Contact Contact { set; get; }
    }
}