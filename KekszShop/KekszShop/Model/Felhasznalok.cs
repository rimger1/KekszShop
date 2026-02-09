using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KekszShop.Model
{
    internal class Felhasznalok
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public string Jelszo { get; set; }
        public string Telefonszam { get; set; }
        public string Email { get; set; }
        public int Tuzesseg { get; set; }

        public Felhasznalok(int id, string nev, string jelszo, string telefonszam, string email, int tuzesseg)
        {
            Id = id;
            Nev = nev;
            Jelszo = jelszo;
            Telefonszam = telefonszam;
            Email = email;
            Tuzesseg = tuzesseg;
        }
        public Felhasznalok() { }
    }
}
