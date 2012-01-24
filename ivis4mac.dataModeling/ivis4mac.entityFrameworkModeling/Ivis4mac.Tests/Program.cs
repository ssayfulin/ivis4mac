using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using Ivis4Mac.Model;

namespace Ivis4Mac.Tests
{
    internal class Program
    {
        private static void Main()
        {
            var dbf = DbProviderFactories.GetFactory("MySql.Data.MySqlClient");
            using (var dbcn = dbf.CreateConnection())
            {
                if (dbcn == null)
                    return;

                dbcn.ConnectionString = "Server=localhost;Database=Ivis4Mac;Uid=root;Pwd=root";

                Database.SetInitializer(new DropCreateDatabaseAlways<Ivis4MacDataContext>());

                using (var db = new Ivis4MacDataContext(dbcn, true))
                {
                    //                    // Use case 1. 
                    //
                    //                    // 
                    //
                    var incident =
                        new Incident
                            {
                                Date = DateTime.Now,
                                Missing = new MissingPerson
                                              {
                                                  Person = new Person
                                                               {
                                                                   FirstName = "Ivan",
                                                                   LastName = "Ivanov",
                                                                   PatronymicName = "Ivanovich",
                                                                   BirthDay = new DateTime(1990, 10, 22),
                                                                   Address = new Address
                                                                                 {
                                                                                     Country = "Russia",
                                                                                     Region =
                                                                                         "Saint-Petersburg",
                                                                                     City =
                                                                                         "Saint-Petersburg",
                                                                                     District = "Ivanovsky",
                                                                                     Street = "Ivana Ivanova",
                                                                                     Building = "1A",
                                                                                     Appartment = 1,
                                                                                 },
                                                                   Contact = new Contact
                                                                                 {
                                                                                     Phone = "79211111111",
                                                                                     Email = "ivan@ivan.com",
                                                                                 }
                                                               }
                                              },
                                PoliceApplication = new PoliceApplication
                                                        {
                                                            ApplicationDate = DateTime.Now.AddDays(-1),
                                                            ContactPersons = new List<Person>
                                                                                 {
                                                                                     new Person
                                                                                         {
                                                                                             FirstName =
                                                                                                 "Ivanna",
                                                                                             LastName =
                                                                                                 "Ivanova",
                                                                                             Contact =
                                                                                                 new Contact
                                                                                                     {
                                                                                                         Phone
                                                                                                             =
                                                                                                             "79218888888",
                                                                                                         CallTimeFrom
                                                                                                             =
                                                                                                             10,
                                                                                                         CallTimeTo
                                                                                                             =
                                                                                                             22,
                                                                                                     }
                                                                                         }
                                                                                 },
                                                            InvestigationOfficer = new Person
                                                                                       {
                                                                                           FirstName = "Ivan",
                                                                                           LastName =
                                                                                               "Pronin",
                                                                                           Contact =
                                                                                               new Contact
                                                                                                   {
                                                                                                       Phone
                                                                                                           =
                                                                                                           "79218888888",
                                                                                                       CallTimeFrom
                                                                                                           =
                                                                                                           10,
                                                                                                       CallTimeTo
                                                                                                           =
                                                                                                           22,
                                                                                                   }
                                                                                       },
                                                            InvestigationProcessed = true,
                                                            History = new Document
                                                                          {
                                                                              Text = "Left home in the night",
                                                                          }
                                                        },
                                Coordinator = new Person
                                                  {
                                                      FirstName = "Konstantin",
                                                      LastName = "Konstantinov",
                                                      PatronymicName = "Ivanovich",
                                                      BirthDay = new DateTime(1990, 10, 22),
                                                      Address = new Address
                                                                    {
                                                                        Country = "Russia",
                                                                        Region = "Saint-Petersburg",
                                                                        City = "Saint-Petersburg",
                                                                        District = "Konstantinovsky",
                                                                        Street = "Konstantina Konstantinova",
                                                                        Building = "1A",
                                                                        Appartment = 1,
                                                                    },
                                                      Contact = new Contact
                                                                    {
                                                                        Phone = "79211111111",
                                                                        Email = "Konstantin@Konstantin.com",
                                                                    }
                                                  }
                            };


                    db.Incidents.Add(incident);


                    db.SaveChanges();
                }
            }
        }
    }
}
