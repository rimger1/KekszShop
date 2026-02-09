using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KekszShop.Model
{
    internal class Termekek
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public decimal Ar { get; set; }
        public string Leiras { get; set; }
        public int Tuzesseg { get; set; }
        public int Kategoria_id { get; set; }

        public Termekek(int id, string nev, decimal ar, string leiras, int tuzesseg, int kategoria_id)
        {
            Id = id;
            Nev = nev;
            Ar = ar;
            Leiras = leiras;
            Tuzesseg = tuzesseg;
            Kategoria_id = kategoria_id;
        }
        public Termekek() { }
    }
}
