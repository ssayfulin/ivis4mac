using System;
using System.Collections.Generic;

namespace Ivis4Mac.Model
{
    public class Incident
    {
        public int Id { set; get; }

        //  *Карточка публичная / закрытая / только администраторам
        public PublicityType Publicity { set; get; }

        //Номер поискового дела открытого волонтерами.
        public int IncidentId { set; get; }

        //Пропал(а) – поле для ввода даты пропажи ребенка, выпадающий свиток дней, месяцев, лет.
        public DateTime Date { set; get; }

        // Кто пропал
        public MissingPerson Missing { set; get; }

        public PoliceApplication PoliceApplication { set; get; }
        
        public IncidentState State { set; get; }

        //*Обстоятельства пропажи – описание обстоятельств пропажи, где, когда, время суток, особые обстоятельства 
        // (ребенок звонил домой, его видели друзья и т.п.). 
        public Document IncidentDescription { set; get; }

        //*Дополнительная информация – поле под дополнительную информацию
        public Document Notes { set; get; }

        //Контакты для поисков – текстовые поля для свободного заполнения
        //МВД
        //МЧС
        //Волонтеры
        //Иное
        public Document Contacts { set; get; }

        //Координацию от волонтеров ведет: ссылка на карточку волонтера или на организацию, 
        // отображается название организации или ФИО волонтера/координатора + телефон.
        public Person Coordinator { set; get; }
        public Organization CoordinatingOrganization { set; get; }

        //Ссылки на рабочие темы – ссылки на рабочие темы по поискам (форумы/сайты) (до 10 ссылок).
        public Document Links { set; get; }

        //*Документы – возможность прикрепить файлы txt, doc, docx, xml, rtf, zip, rar
        public FileLink FilesLink { set; get; }

        //Ссылка на карту – карта google/yandex с отметками (Вопрос по реализации. 
        //Это прямая ссылка или открытие внутри обвязки отдельного окна с картой? Т.е. открываем карточку с пропавшим для просмотра, 
        //и у нас отдельное окошко с картой или мы нажимаем на ссылку и переходим на страницу? Устроит любой вариант.)
        public MapLink MapLink { set; get; }

        // Данные введены (заполняется автоматически)
        // Пользователь 
        // Дата
        public Person Registrator { set; get; }
        public Person RegistrationDate { set; get; }
    }


    public class Incident2
    {
       
        //  *Карточка публичная / закрытая / только администраторам
        public PublicityType Publicity { set; get; }

        //Номер поискового дела открытого волонтерами.
        public int IncidentId { set; get; }



        // Кто пропал
        public MissingPerson Missing { set; get; }

        public PoliceApplication PoliceApplication { set; get; }

     
        //*Обстоятельства пропажи – описание обстоятельств пропажи, где, когда, время суток, особые обстоятельства 
        // (ребенок звонил домой, его видели друзья и т.п.). 
        public Document IncidentDescription { set; get; }

        //*Дополнительная информация – поле под дополнительную информацию
        public Document Notes { set; get; }

        //Контакты для поисков – текстовые поля для свободного заполнения
        //МВД
        //МЧС
        //Волонтеры
        //Иное
        public Document Contacts { set; get; }

        //Координацию от волонтеров ведет: ссылка на карточку волонтера или на организацию, 
        // отображается название организации или ФИО волонтера/координатора + телефон.
        public Person Coordinator { set; get; }
        public Organization CoordinatingOrganization { set; get; }

        //Ссылки на рабочие темы – ссылки на рабочие темы по поискам (форумы/сайты) (до 10 ссылок).
        public Document Links { set; get; }

        //*Документы – возможность прикрепить файлы txt, doc, docx, xml, rtf, zip, rar
        public FileLink FilesLink { set; get; }

        //Ссылка на карту – карта google/yandex с отметками (Вопрос по реализации. 
        //Это прямая ссылка или открытие внутри обвязки отдельного окна с картой? Т.е. открываем карточку с пропавшим для просмотра, 
        //и у нас отдельное окошко с картой или мы нажимаем на ссылку и переходим на страницу? Устроит любой вариант.)
        public MapLink MapLink { set; get; }

    }


}