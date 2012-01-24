namespace Ivis4Mac.Model
{
    public class IncidentState
    {
        public int Id { set; get; }
        // найден,
        // завершен
        //В розыске / погиб(ла) / погиб(ла)-НС / погиб(ла)-К / найден(а) – свиток состояния дела 
        public string State { set; get; }
    }
}