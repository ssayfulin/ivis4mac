namespace Ivis4Mac.Model
{
    public class Address
    {
        public int Id { get; set; }
        // Страна – поле для ввода страны.
        public string Country { get; set; }
        // Область – поле для ввода информации по области.
        public string Region { get; set; }
        // Например Боровический район Новгородской области
        public string District { get; set; }
        // Город/село – поле, для ввода населенного пункта. 
        public string City { get; set; }
        //*Улица, дом, квартира
        public string Street { get; set; }
        public string Building { get; set; }
        public int Appartment { get; set; }
    }
}