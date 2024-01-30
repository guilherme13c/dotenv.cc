#include <dotenv/config.h>
#include <iostream>

int main() {
    Env cfg;
    newConfig(cfg);

    for (const auto &var : cfg) {
        std::cout << var.first << "=" << var.second << std::endl;
    }

    return 0;
}
