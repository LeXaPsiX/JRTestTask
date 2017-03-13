package ru.javarush.config;

        import org.springframework.web.context.ContextLoaderListener;
        import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
        import org.springframework.web.filter.CharacterEncodingFilter;
        import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
        import javax.servlet.FilterRegistration;
        import javax.servlet.ServletContext;
        import javax.servlet.ServletException;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(AppConfig.class, HibernateConfig.class);
        servletContext.addListener(new ContextLoaderListener(rootContext));

        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encoding-filter", new CharacterEncodingFilter());
        encodingFilter.setInitParameter("encoding", "UTF-8");
        encodingFilter.setInitParameter("forceEncoding", "true");
        encodingFilter.addMappingForUrlPatterns(null, true, "/*");
    }

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {HibernateConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[0];
    }
}