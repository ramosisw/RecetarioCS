using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using Recetario.Nucleo.Persistencia;
using NHibernate;
using NHibernate.Criterion;

namespace Recetario.Nucleo.Entidades {
    public class Receta : Persistent {
        #region Entidad
        public Receta() { }
        public Receta(int id) {
            this.Id = id;
        }
        public override int Id { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        public string Nombre { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [MaxLength(1000)]
        public string Descripcion { get; set; }

        [Required]
        public int Porciones { get; set; }

        [Display(Name = "Imagen")]
        public HttpPostedFileBase Imagen { get; set; }

        public String PathImage { get; set; }

        [Required]
        public IList<Ingrediente> Ingredientes { get; set; }

        [Required]
        [Display(Name = "Paso")]
        public IList<Paso> Pasos { get; set; }
        #endregion Entidad

        #region Persistencia
        /*
        param id equals to id of Receta
         * return receta of this id or null
        */
        public static Receta GetById(int id) {
            Receta receta = new Receta();
            try {
                using (ISession session = Persistent.SessionFactory.OpenSession()) {
                    ICriteria crit = session.CreateCriteria(receta.GetType());
                    crit.Add(Expression.Eq("Id", id));
                    receta = crit.UniqueResult<Receta>();
                }
            } catch (Exception ex) {
                throw ex;
            }
            return receta;
        }
        //Return all Recetas on DataBase
        public static IList<Receta> GetAll() {
            IList<Receta> recetas = new List<Receta>();
            try {
                using (ISession session = Persistent.SessionFactory.OpenSession()) {
                    ICriteria crit = session.CreateCriteria("Receta");
                    recetas = crit.List<Receta>();
                }
            } catch (Exception ex) {
                throw ex;
            }
            return recetas;
        }
        #endregion Persistencia
    }
}
