package edu.cibertec.capitulo03.controller;

import edu.cibertec.capitulo03.model.UsuarioEntity;
import edu.cibertec.capitulo03.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@SessionAttributes("contador")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("loginMostrar")
    public String loginMostrar() {
        return "login";
    }

    @RequestMapping("loginAccion")
    public ModelAndView loginAccion(UsuarioEntity usuarioValida) {
        ModelAndView mv = null;

        UsuarioEntity ue = usuarioService.validarLogin(usuarioValida);

        if (ue == null) {
            mv = new ModelAndView("login", "msgError", "Usuario y clave no existen. Vuelva a intentar!");
        } else {
            mv = new ModelAndView("usuarioLista", "lista",
                    usuarioService.listarUsuarios());
            mv.addObject("contador", 0);
        }
        return mv;
    }

    @RequestMapping("listaUsuarios")
    public ModelAndView listaUsuarios() {
        List<UsuarioEntity> usuarios = usuarioService.listarUsuarios();
        return new ModelAndView("usuarioLista", "lista", usuarios);
    }

    @RequestMapping("usuarioCrear")
    public ModelAndView crearUsuario() {
        return new ModelAndView("usuarioDatos", "usuarioBean",
                new UsuarioEntity());
    }

    @RequestMapping("usuarioGrabar")
    public ModelAndView grabarUsuario(
            @Valid @ModelAttribute("usuarioBean") UsuarioEntity usuario,
            BindingResult resulta, ModelMap modelo) {

        ModelAndView mv = null;

        if (resulta.hasErrors()) {
            mv = new ModelAndView("usuarioDatos", "usuarioBean",
                    usuario);
        } else {
            usuarioService.insertarUsuario(usuario);
            mv = new ModelAndView("usuarioLista", "lista",
                    usuarioService.listarUsuarios());
            int contador = (int) modelo.get("contador");
            contador++;
            mv.addObject("contador", contador);
        }

        return mv;
    }

    @RequestMapping("usuarioEliminar")
    public ModelAndView eliminarUsuario(@RequestParam("id") int id) {
        UsuarioEntity usuario = new UsuarioEntity();
        usuario.setId(id);
        usuarioService.eliminarUsuario(usuario);

        return new ModelAndView("usuarioLista", "lista",
                usuarioService.listarUsuarios());
    }

    @RequestMapping("mostrarFoto")
    public String mostrarFoto(HttpServletRequest request, Model model) {
        model.addAttribute("usuario", usuarioService.
                obtenerUsuario(Integer.parseInt(request.getParameter("idUsuario"))));

        return "fotoUsuario";
    }

    @RequestMapping("registrarFoto")
    public ModelAndView registrarFoto(@RequestParam("archivo") CommonsMultipartFile archivo,
                                      @RequestParam("idUsuario") int id) {
        Optional<UsuarioEntity> usuario = usuarioService.obtenerUsuario(id);
        usuario.get().setFoto(archivo.getBytes());
        return new ModelAndView("usuarioLista", "lista",
                usuarioService.listarUsuarios());
    }
}
