using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiCoinkModel
{
    public class Usuario
    {
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Telefono { get; set; }
        [Required] 
        public string Direccion { get; set; }
        [Required]
        [Range(1, 999.99)]
        public int Municipio_Id { get; set; }
        
    }
}
