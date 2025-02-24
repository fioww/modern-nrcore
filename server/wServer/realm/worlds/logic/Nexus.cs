﻿using System.Linq;
using common.resources;
using wServer.networking;
using wServer.realm.entities;
using wServer.realm.terrain;

namespace wServer.realm.worlds.logic
{
    class Nexus : World
    {
        public Nexus(ProtoWorld proto, Client client = null) : base(proto)
        {
        }

        protected override void Init()
        {
            base.Init();
            
            var monitor = Manager.Monitor;
            foreach (var i in Manager.Worlds.Values)
            {
                if (i is Realm)
                {
                    monitor.AddPortal(i.Id);
                    continue;
                }

                if (i.Id >= 0)
                    continue;


                if (i is PetYard)
                {
                    var portal = new Portal(Manager, 0x166, null)
                    {
                        Name = "Pet Yard",
                        WorldInstance = i
                    };

                    var pos = GetRegionPosition(TileRegion.Store_40);
                    if (pos == null)
                        continue;

                    monitor.AddPortal(i.Id, portal, pos);
                    continue;
                }

                if (i.Name.Equals("ClothBazaar"))
                {
                    var portal = new Portal(Manager, 0x167, null)
                    {
                        Name = "Cloth Bazaar (0)",
                        WorldInstance = i
                    };

                    var pos = GetRegionPosition(TileRegion.Store_39);
                    if (pos == null)
                        continue;

                    monitor.AddPortal(i.Id, portal, pos);
                    continue;
                }
            }
        }
    }
}
