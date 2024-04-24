package sv.edu.udb.www.springbootmvcs.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sv.edu.udb.www.springbootmvcs.dao.EstudianteDAO;
import sv.edu.udb.www.springbootmvcs.entities.EstudiantesEntity;

@Controller
@RequestMapping("/estudiantes")
public class EstudianteController {

    @Autowired
    private EstudianteDAO estudianteDAO;

    @GetMapping("/lista")
    public String listaEstudiantes(Model model){
        model.addAttribute("estudiantes", estudianteDAO.obtenerTodosEstudiantes());
        return "estudiantes/listaEstudiantes";
    }

    @GetMapping("/nuevo")
    public String nuevoEstudiante(Model model){
        EstudiantesEntity estudiante = new EstudiantesEntity();
        model.addAttribute("estudiante", estudiante);
        return "estudiantes/nuevoEstudiante";
    }

    @PostMapping("/guardar")
    public String guardarEstudiante(@Valid @ModelAttribute("estudiante") EstudiantesEntity estudiante,
                                    BindingResult result, Model model,
                                    RedirectAttributes atributos){
        if(result.hasErrors()){
            model.addAttribute("estudiante", estudiante);
            return "estudiantes/nuevoEstudiante";
        }
        estudianteDAO.guardarEstudiante(estudiante);
        atributos.addFlashAttribute("exito", "Estudiante agregado");
        return "redirect:/estudiantes/lista";
    }

    @GetMapping("/editar/{carnet}")
    public String editarEstudiante(@PathVariable String carnet, Model model){
        model.addAttribute("estudiante", estudianteDAO.obtenerEstudiantePorCarnet(carnet));
        return "estudiantes/modificarEstudiante";
    }

    @PostMapping("/modificar")
    public String modificarEstudiante(@ModelAttribute("estudiante") EstudiantesEntity estudiante){
        EstudiantesEntity estudianteExistente = estudianteDAO.obtenerEstudiantePorCarnet(estudiante.getCarnet());

        if(estudianteExistente == null) {
            // Manejo de error si el estudiante no existe
            return "redirect:/estudiantes/lista";
        }

        estudianteDAO.actualizarEstudiante(estudiante);
        return "redirect:/estudiantes/lista";
    }

    @GetMapping("/eliminar/{carnet}")
    public String eliminarEstudiante(@PathVariable String carnet){
        estudianteDAO.eliminarEstudiantePorCarnet(carnet);
        return "redirect:/estudiantes/lista";
    }
}
