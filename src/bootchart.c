#include "log.h"

extern char *program_invocation_name;

int main(int argc, char *argv[]) {
  log_internal();
  return 0;
}
