import {
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
} from '@mui/material';
import { toPng } from 'html-to-image';
import { PigQR } from './PigQR';
import { useRef } from 'react';
import { toast } from 'react-toastify';

export const QRPigShowModal = ({
  selectedPig,
  isOpen,
  onClose,
}: {
  selectedPig: any;
  isOpen: boolean;
  onClose?: () => void;
}) => {
  const qrRef = useRef<any>(null);

  const handleDownload = async () => {
    if (qrRef.current === null) {
      return;
    }

    try {
      const dataUrl = await toPng(qrRef.current, { skipFonts: true });
      const blob = await (await fetch(dataUrl)).blob();
      const fileHandle = await (window as any).showSaveFilePicker({
        suggestedName: `${selectedPig.pigNumber.replace('P-', '')}.png`,
        types: [
          {
            description: 'PNG Image',
            accept: { 'image/png': ['.png'] },
          },
        ],
      });
      const writableStream = await fileHandle.createWritable();
      await writableStream.write(blob);
      await writableStream.close();
      toast.success('Image downloaded successfully');
    } catch (error) {
      console.error('Failed to generate image', error);
      toast.error('Failed to generate image');
    }
  };

  return (
    <Dialog open={isOpen} onClose={onClose}>
      <DialogTitle>VIEW PIG QR</DialogTitle>
      <DialogContent>
        <PigQR
          ref={qrRef}
          label={selectedPig.pigNumber.replace('P-', '')}
          qrValue={'pigkeep:' + selectedPig.pigNumber + ':' + selectedPig.uuid}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Close
        </Button>
        <Button onClick={() => handleDownload()} color="primary">
          Download
        </Button>
      </DialogActions>
    </Dialog>
  );
};
