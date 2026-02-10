using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KekszShop.Model
{
    internal class Rendeles
    {
        public static void TermekCsvbeIras(Termekek termek)
        {
            string fajlNev = "rendeles.csv";

            if (!File.Exists(fajlNev))
                File.WriteAllText(fajlNev, "Nev;Ar\n");

            File.AppendAllText(fajlNev, $"{termek.Nev};{termek.Ar}\n");
        }
    }
}
