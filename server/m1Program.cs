using GraphQL.MicrosoftDI;
using GraphQL.Server;
using GraphQL.SystemTextJson;
using GraphQL.Types;
using Server.EntityFramework;
using Server.Models.User;
using Server.Models.Doctor;
using Server.Models.Chat;

using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
//builder.Services.AddDbContext<DataContext>();
builder.Services.AddDbContext<DataContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("Default");
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});
// builder.Services.AddSingleton<ISchema, UserSchema>(services => new UserSchema(new SelfActivatingServiceProvider(services)));
// builder.Services.AddSingleton<ISchema, DoctorSchema>(services => new DoctorSchema(new SelfActivatingServiceProvider(services)));
// builder.Services.AddSingleton<ISchema, ChatSchema>(services => new ChatSchema(new SelfActivatingServiceProvider(services)));
// builder.Services.AddGraphQL<UserSchema>((options) =>
//         {
//             options.AutoRegisterLocalGraphEntities = false;
//             options.QueryHandler.Route = "/graphql_user";
//             // add assembly or graph type references here
//         });
// builder.Services.AddGraphQL<DoctorSchema>((options) =>
//         {
//             options.AutoRegisterLocalGraphEntities = false;
//             options.QueryHandler.Route = "/graphql_doctor";
//             // add assembly or graph type references here
//         });

// builder.Services.AddGraphQL<ChatSchema>((options) =>
//         {
//             options.AutoRegisterLocalGraphEntities = false;
//             options.QueryHandler.Route = "/graphql_chat";
//             // add assembly or graph type references here
//         });
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
        builder =>
        {
            builder.WithOrigins("*")
                   .AllowAnyHeader();
        });
});

builder.Services.AddControllers();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "GraphQLNetExample", Version = "v1" });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "GraphQLNetExample v1"));
    app.UseGraphQLAltair();
}

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.UseGraphQL<ISchema>();

app.Run();
