using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace Recetario.Nucleo.Entidades {
    public class Ingrediente {
        #region Entidad
        public int Id { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [MaxLength(50)]
        public string Nombre { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [MaxLength(50)]
        public string Cantidad { get; set; }
        #endregion Entidad
        

        #region Persistencia
        #endregion Persistencia
    }
}
