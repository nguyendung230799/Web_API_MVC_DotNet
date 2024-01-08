using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Owin;
using Owin;
using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Repositories;
using REPORT_MANAGEMENT_CORE.Repositories.Implement;
using REPORT_MANAGEMENT_CORE.Services;
using REPORT_MANAGEMENT_CORE.Services.Implement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Dependencies;
using System.Web.Mvc;
using static REPORT_MANAGEMENT_CORE.Data.Domains.IdentityModels;

[assembly: OwinStartup(typeof(REPORT_MANAGEMENT_APP.Startup))]

namespace REPORT_MANAGEMENT_APP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

            var services = new ServiceCollection();
            ConfigureServices(services);
            var resolver = new DefaultDependencyResolver(services.BuildServiceProvider());

            // Set MVC Resolver
            DependencyResolver.SetResolver(resolver);
            // MVC Route
            /*
            RouteTable.Routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional });
            */

            // Set WebAPI Resolver and register
            var config = new HttpConfiguration
            {
                DependencyResolver = resolver
            };

            /*
            config.SuppressDefaultHostAuthentication();
            config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));
            /*
            // Use camel case for JSON data.
            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            */

            // Web API routes
            config.MapHttpAttributeRoutes();

            // WebApi Route
            config.Routes.MapHttpRoute(
                name: "MyDefaultApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            app.UseWebApi(config);
            app.UseStaticFiles();

            app.UseStaticFiles("/img");

            //CreateRolesandUsers();
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersAsServices(typeof(Startup).Assembly.GetExportedTypes()
                   .Where(t => !t.IsAbstract && !t.IsGenericTypeDefinition)
                   .Where(t => typeof(IController).IsAssignableFrom(t)
                      || t.Name.EndsWith("Controller", StringComparison.OrdinalIgnoreCase)));

            services.AddTransient(typeof(ApplicationDbContext));
            services.AddSingleton<IUnitOfWork, UnitOfWork>();
            services.AddSingleton<IActionLogService, ActionLogService>();
            services.AddSingleton<ICatalogueBudgetService, CatalogueBudgetService>();
            services.AddSingleton<ICatalogueDepartmentService, CatalogueDepartmentService>();
            services.AddSingleton<IDocumentService, DocumentService>();
            services.AddSingleton<IFileMetadataService, FileMetadataService>();
            services.AddSingleton<IFileService, FileService>();
            services.AddSingleton<IFolderService, FolderService>();
            services.AddSingleton<IUserService, UserService>();

            services.AddSingleton<ILoggerFactory, LoggerFactory>();
            services.AddSingleton(typeof(ILogger<>), typeof(Logger<>));
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddAuthorization(options =>
            {
                options.AddPolicy("SamplePolicy", policy =>
                {
                    policy.RequireRole("SamplePolicy");
                    policy.RequireClaim(ClaimTypes.AuthorizationDecision, "SamplePolicy");
                    policy.RequireAssertion(context =>
                        context.User.HasClaim(claim => claim.Type == "SamplePolicy")
                        || context.User.HasClaim(claim => claim.Type == "SamplePolicy")
                        || context.User.IsInRole("SamplePolicy"));
                });
                options.AddPolicy("Verified", policy =>
                {
                    policy.RequireRole(nameof(Roles.Moderator));
                    policy.RequireClaim(nameof(Claims.Approved), nameof(Claims.Approved));
                });
            });
        }

        private void CreateRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new ApplicationRoleManager(new ApplicationRoleStore(context));
            var userManager = new ApplicationUserManager(new ApplicationUserStore(context));

            var initRoles = new List<string> { nameof(Roles.Moderator), nameof(Roles.Administrator), nameof(Roles.Manager), nameof(Roles.Basic), nameof(Roles.Assistant) };

            foreach (var initRole in initRoles)
            {
                if (!roleManager.RoleExists(initRole))
                {
                    roleManager.Create(new ApplicationRole()
                    {
                        Id = Guid.NewGuid(),
                        Name = initRole,
                    });

                    if (initRole == nameof(Roles.Administrator))
                    {
                        var user = new ApplicationUser()
                        {
                            Id = Guid.NewGuid(),
                            UserName = Constants.EMAIL_ADMIN,
                            Email = Constants.EMAIL_ADMIN,
                            Hometown = Constants.HOMETOWN,
                            EmailConfirmed = true
                        };
                        string password = Constants.AUTH_ADMIN;
                        var checkUser = userManager.Create(user, password);
                        //Add default User to Role Admin    
                        if (checkUser.Succeeded)
                        {
                            var initClaims = new Claim(nameof(Claims.Approved), nameof(Claims.Approved));
                            userManager.AddToRole(user.Id, nameof(Roles.Administrator));
                            userManager.AddToRole(user.Id, nameof(Roles.Moderator));
                            userManager.AddClaim(user.Id, initClaims);
                        }
                    }
                }
            }
        }
    }


    public class DefaultDependencyResolver : System.Web.Mvc.IDependencyResolver, System.Web.Http.Dependencies.IDependencyResolver
    {
        protected IServiceProvider serviceProvider;

        public DefaultDependencyResolver(IServiceProvider serviceProvider)
        {
            this.serviceProvider = serviceProvider;
        }

        public IDependencyScope BeginScope()
        {
            return new DefaultDependencyResolver(this.serviceProvider.CreateScope().ServiceProvider);
        }

        public void Dispose()
        {
            //throw new NotImplementedException();
        }

        public object GetService(Type serviceType)
        {
            return this.serviceProvider.GetService(serviceType);
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return this.serviceProvider.GetServices(serviceType);
        }
    }

    public static class ServiceProviderExtensions
    {
        public static IServiceCollection AddControllersAsServices(this IServiceCollection services,
            IEnumerable<Type> controllerTypes)
        {
            foreach (var type in controllerTypes)
            {
                services.AddTransient(type);
            }

            return services;
        }
    }
}
