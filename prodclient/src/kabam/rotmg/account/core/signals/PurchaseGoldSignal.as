// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.account.core.signals.PurchaseGoldSignal

package kabam.rotmg.account.core.signals
{
    import org.osflash.signals.Signal;
    import com.company.assembleegameclient.util.offer.Offer;

    public class PurchaseGoldSignal extends Signal 
    {

        public function PurchaseGoldSignal()
        {
            super(Offer, String);
        }

    }
}//package kabam.rotmg.account.core.signals

