using Recetario.Nucleo.Entidades;
using System;
using System.Drawing;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;


namespace Recetario.Presentacion.Controllers {
    public class RecetaController : Controller {
        //
        // GET: /Home/
        //Deploy list all Recetas
        public ActionResult Index() {
            return View(Receta.GetAll());            
        }

        //Deploy new form for new Receta
        public ActionResult Nueva() {
            return View();
        }

        //Receive a form of new Receta and proccess this
        [HttpPost]
        public ActionResult Nueva(Receta receta) {
            var path = "";
            if (ModelState.IsValid) {
                if (receta.Imagen != null) {
                    if (receta.Imagen.ContentLength > 0) {
                        do {
                            try {
                                receta.PathImage = getRandom().ToString() + "." + receta.Imagen.FileName.Split('.')[1];
                                path = Path.Combine(Server.MapPath("~/Images/Upload"), receta.PathImage);
                            } catch (Exception ex) {
                                throw ex;
                            }
                        } while (System.IO.File.Exists(path));
                        receta.Imagen.SaveAs(path);
                    } else {

                    }
                } else {

                }
                receta.Save();
                return RedirectToAction("Detalles", new { Id = receta.Id });
            }
            return View(receta);
        }
        
        public ActionResult Actualizar(int Id) {
            return View(Receta.GetById(Id));
        }
        private int getRandom() {
            Random random = new Random();
            return random.Next(1000000, 9999999);
        }
        [HttpPost]
        public ActionResult Actualizar(Receta receta) {
            var path = "";
            if (ModelState.IsValid) {
                if (receta.Imagen != null) {
                    if (receta.Imagen.ContentLength > 0) {
                        do {
                            try {
                                receta.PathImage = getRandom().ToString() + "." + receta.Imagen.FileName.Split('.')[1];
                                path = Path.Combine(Server.MapPath("~/Images/Upload"), receta.PathImage);
                            } catch (Exception ex) {
                                throw ex;
                            }
                        } while (System.IO.File.Exists(path));
                        receta.Imagen.SaveAs(path);
                    } else {

                    }
                } else {

                }
                receta.Update();
                return RedirectToAction("Detalles", new { Id = receta.Id });
            }
            return View(receta);
        }

        public ActionResult Detalles(int Id) {
            return View(Receta.GetById(Id));
        }
        public ActionResult Eliminar(int Id) {
            if (Receta.GetById(Id) != null){
                Receta.GetById(Id).Delete();
            }
            return RedirectToAction("Index");
        }

    }
}
