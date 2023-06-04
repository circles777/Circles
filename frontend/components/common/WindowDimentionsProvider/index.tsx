import { useEffect } from "react";
import { useWindowMutators } from "../../../utils/recoil/window";

interface WindowDimentionsProps {
  children: React.ReactNode;
}

export const WindowDimentionsProvider: React.FC<WindowDimentionsProps> = ({
  children,
}) => {
  const { setWindowHeight, setWindowWidth } = useWindowMutators();
  useEffect(() => {
    setWindowHeight(window.innerHeight);
    setWindowWidth(window.innerWidth);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [window.innerWidth, window.innerHeight]);
  return <>{children}</>;
};
