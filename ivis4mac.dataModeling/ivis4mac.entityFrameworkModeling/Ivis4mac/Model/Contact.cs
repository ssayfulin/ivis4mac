using System;

namespace Ivis4Mac.Model
{
    public class Contact
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string PhoneWorking { get; set; }
        public string Email { get; set; }
        public string Skype { get; set; }
        public string ICQ { get; set; }
        public string Site { get; set; }
        public Document ExtraInformation { get; set; }
        // звонить от 
        public int CallTimeFrom { set; get; }
        // звонить до 
        public int CallTimeTo { set; get; }
    }
}