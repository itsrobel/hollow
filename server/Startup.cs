using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using GraphQL.MicrosoftDI;
using GraphQL.Server;
using GraphQL.SystemTextJson;
using GraphQL.Types;
using Server.EntityFramework;
using Server.Models.Chat;
using Server.Models.User;
namespace Server
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services
            .AddGraphQL<UserSchema>((services) =>
            {
                new UserSchema(new SelfActivatingServiceProvider(services));

            })
            //    .AddGraphQL<UserSchema>((options) =>
            //     {

            //         options.AutoRegisterLocalGraphEntities = false;
            //         options.QueryHandler.Route = "/graphql_user";
            //         //add assembly or graph type references here
            //     })
            //     .AddGraphQL<DoctorSchema>((options) =>
            //     {
            //         options.AutoRegisterLocalGraphEntities = false;
            //         options.QueryHandler.Route = "/graphql_doctor";
            //     })
            .AddGraphQLServer()
                .AddQueryType<Query>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGraphQL();
            });
        }
    }
}
