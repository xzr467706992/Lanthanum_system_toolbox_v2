package xzr.La.systemtoolbox.modules.java;
import android.content.Context;
import android.view.View;

public interface LModule {
    String classname();
    View init(Context context);
    String onbootapply();
}
