using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KekszShop.Model
{
    internal class Kategoria
    {
        public int Id { get; set; }
        public string Nev { get; set; }

        public Kategoria(int id, string nev)
        {
            Id = id;
            Nev = nev;
        }
        public Kategoria() { }
    }
}
