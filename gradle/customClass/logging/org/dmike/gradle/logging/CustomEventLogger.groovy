/******************************************************************************
* Custom loggin implementation from task listener
* To make gradle automtic build this class and add in classpath
* put this one in rootProject/buildSrc/src/main/groovy/
*******************************************************************************/
package org.dmike.gradle.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.gradle.*;
import org.gradle.api.*;
import org.gradle.api.tasks.*;
import org.gradle.api.invocation.*;
import org.gradle.api.execution.*;

public class CustomEventLogger extends BuildAdapter implements TaskExecutionListener{
  private static Logger LOG = LoggerFactory.getLogger('org.dmike.gradle.logging');

  public void beforeExecute(Task task) {
    LOG.quiet("[INFO] TASK-$task.name");
  }

  public void afterExecute(Task task, TaskState state) {
    LOG.quiet('');
  }

  public void buildFinished(BuildResult result) {
    LOG.quiet('[INFO] build completed');
    if (result.failure != null) {
        result.failure.printStackTrace();
    }
  }
}
