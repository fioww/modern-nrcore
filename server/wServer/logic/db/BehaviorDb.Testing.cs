using common.resources;
using wServer.logic.behaviors;
using wServer.logic.loot;

namespace wServer.logic;

partial class BehaviorDb
{
    private _ Testing = () => Behav()
        .Init("Medusa",
            new State(
                new DropPortalOnDeath("Snake Pit Portal", .04),
                new Prioritize(
                    new StayAbove(1, 200),
                    new Follow(1, range: 7),
                    new Wander(0.4)
                ),
                new Shoot(12, count: 5, shootAngle: 10, coolDown: 2000),
                new Grenade(4, 150, range: 8, coolDown: 5000),
                new Reproduce(densityMax: 3)
            ),
            new Threshold(.1,
                new TierLoot(6, ItemType.Weapon, 0.1),
                new TierLoot(7, ItemType.Weapon, 0.07),
                new TierLoot(8, ItemType.Weapon, 0.01),
                new TierLoot(7, ItemType.Armor, 0.1),
                new TierLoot(8, ItemType.Armor, 0.07),
                new TierLoot(9, ItemType.Armor, 0.01),
                new TierLoot(4, ItemType.Ring, 0.01),
                new TierLoot(4, ItemType.Ability, 0.01)
            ),
            new Threshold(0.07,
                new ItemLoot("Potion of Speed", 0.07)
            )
        );
}