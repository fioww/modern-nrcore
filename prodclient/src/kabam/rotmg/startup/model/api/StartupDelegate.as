// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.startup.model.api.StartupDelegate

package kabam.rotmg.startup.model.api
{
    import kabam.lib.tasks.Task;

    public interface StartupDelegate 
    {

        function getPriority():int;
        function make():Task;

    }
}//package kabam.rotmg.startup.model.api

