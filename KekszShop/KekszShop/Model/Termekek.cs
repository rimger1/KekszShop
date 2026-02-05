using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KekszShop.Model
{
    internal class Termekek
    {
        public class Felhasznalo
        {
            public int Id { get; set; }
            public string Nev { get; set; }
            public string Jelszo { get; set; }
            public string Telefonszam { get; set; }
            public string Email { get; set; }
            public int Tuzesseg { get; set; }

            public Felhasznalo(int id, string nev, string jelszo, string telefonszam, string email, int tuzesseg)
            {
                Id = id;
                Nev = nev;
                Jelszo = jelszo;
                Telefonszam = telefonszam;
                Email = email;
                Tuzesseg = tuzesseg;
            }
        }
        public class Termek
        {
            public int Id { get; set; }
            public string Nev { get; set; }
            public decimal Ar { get; set; }
            public string Leiras { get; set; }
            public int Tuzesseg { get; set; }
            public int Kategoria_id { get; set; }

            public Termek(int id, string nev, decimal ar, string leiras, int tuzesseg, int kategoria_id)
            {
                Id = id;
                Nev = nev;
                Ar = ar;
                Leiras = leiras;
                Tuzesseg = tuzesseg;
                Kategoria_id = kategoria_id;
            }
        }
        public class Kategoria
        {
            public int Id { get; set; }
            public string Nev { get; set; }

            public Kategoria(int id, string nev)
            {
                Id = id;
                Nev = nev;
            }
        }

    }
}
