void DoWork() {
	try {
		throw 42;
	} catch (...) {
		throw;
	}
}

int TryDoWork() {
	int err = 0;

	try {
		DoWork();
	} catch (const int& ex) {
		err = ex;
	} catch (...) {
		err = 1;
	}

	return err;
}

int main() {
	const auto err = TryDoWork();
	return err;
}
