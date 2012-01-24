using System.Collections.Generic;

namespace Ivis4Mac.Model
{

    public class PersonSignType
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public List<string> Values { set; get; }
    }
}